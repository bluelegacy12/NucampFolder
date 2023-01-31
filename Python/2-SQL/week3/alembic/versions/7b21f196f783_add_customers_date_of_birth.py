"""add customers date_of_birth

Revision ID: 7b21f196f783
Revises: 9eb4451418c2
Create Date: 2022-11-04 10:09:26.706054

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7b21f196f783'
down_revision = '9eb4451418c2'
branch_labels = None
depends_on = None


def upgrade():
    op.execute(
        """
        ALTER TABLE customers
        ADD COLUMN date_of_birth TIMESTAMP;
        """
    )


def downgrade():
    op.execute(
        """
        ALTER TABLE customers
        DROP COLUMN date_of_birth;
        """
    )
